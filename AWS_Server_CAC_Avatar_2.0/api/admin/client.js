const express = require('express');
const { Op } = require("sequelize");
const multer = require('multer');
const router = express.Router();
const Clients = require('../../model/clients');
const { prepareAndGetQuery } = require('../common/queryUtil');
const formidable = require('formidable');

const Usecases = require('../../model/usecases');

var cors = require('cors')
router.use(cors())

router.get('/', (req, res) => {
    const query = prepareAndGetQuery(req);
    Clients.findAndCountAll(query).then((data) => {
        res.status(200).send(data);
    }).catch((err) => {
        console.log('error fetching Clients table : ', err);
        res.status(500).send(err);
    });
}); 

router.post('/', (req, res) => {
    Clients.create(req.body).then(data => {
        res.status(200).send(data);
    }).catch(err => {
        console.log('error inserting into Clients table :', err);
        res.status(500).send(err);
    });
});
const storage = multer.diskStorage({
    destination: (req, file, cb) => {
        cb(null, 'api/public')
    },
    filename: (req, file, cb) => {
        cb(null,file.originalname)
    }
});
const upload = multer({ storage }).array('file');
router.post('/upload', (req, res) => {
    upload(req, res, (err) => {
        if (err) {
            return res.status(500).json(err)
            
        }

        return res.status(200).send(req.files)
    })
});

router.post('/upload/folder', (req, res) => {
     var fs1 = require('fs'); 
     var dir = 'api/public';
      if (!fs1.existsSync(dir)) { fs1.mkdirSync(dir);
      }
     let form = new formidable.IncomingForm();
     //Process the file upload in Node
     form.parse(req, function (error, fields, file) {
         //console.log("files", file, fields)
         //console.log(file)
         let tempdir = ""
         for (const [key, value] of Object.entries(file)) {
             let fs = require('fs');
             tempdir= ""
             //console.log(value.originalFilename.split('/'))
             value.originalFilename.split('/').map((element,index)=>{
             //      tempdir=dir + "/" + element
             //   if (!fs1.existsSync(tempdir) && index != value.originalFilename.split('/').length-1) {
             //      fs1.mkdirSync(tempdir);
             // }
             if (index != value.originalFilename.split('/').length-1) {
             tempdir =   tempdir + element + "/" 
             }
             })
             if (!fs1.existsSync(dir + "/"+ tempdir)){
                 fs1.mkdirSync(dir + "/"+ tempdir, { recursive: true });
             }
            console.log(tempdir)
             // const filepath = key.split('.')[1].toLowerCase() == "json" ? "save-internally/src/jsonFile/" : "save-internally/src/fileupload/"
             const filepath = dir + "/"+ tempdir + "/"
             fs.readFile(value.filepath, function (err, data) {
                 fs.writeFile(filepath + key, data, function (err) {
                     if (err) throw err;
                     console.log('File is created successfully.');
                 });
             });
         }
     });
 });

router.put('/:clientId', (req, res) => {
    const { clientId } = req.params;
    Clients.update(req.body, { where: { clientId } }).then(data => {
        res.status(200).send(data);
    }).catch(err => {
        console.log('error updating Clients table :', err);
        res.status(500).send(err);
    });
});

router.delete('/:clientId', (req, res) => {
    const { clientId } = req.params;
    Clients.destroy({ where: { clientId: parseInt(clientId) } }).then(() => {
        res.sendStatus(200);
    }).catch(err => {
        console.log('error deleting record from Clients table :', err);
        res.status(500).send(err);
    });
});

// const JSON_FOLDER = './api/public';


router.post('/api/json-files', (req, res) => {
    var fs = require('fs'); 
    // console.log("%%%%%%%%%%%%%%%%%%%%%%", req)
    const { useCaseId } = req.body;
    const query = { where: { ['useCaseId']: useCaseId } };
    Usecases.findAll(query).then((data) => {
        // console.log("@@@@@@@@@@@@@@", data[0].JSON_File_Path)      
        console.log("@@@@@@@@@@@@@@", data)

        const path = require('path');
                fs.readdir(data[0].JSON_File_Path, (err, files) => {
            if (err) {
                    console.log("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$", err);
            res.status(500).send('Error reading JSON folder');
            } else {
      const jsonFiles = files.filter(file => path.extname(file) === '.json');
      const jsonFileNames = jsonFiles.map(file => path.basename(file));
      res.json({jsonFileNames, modulename: data[0].name});
    }
  });
        // res.status(200).send(data);
        console.log("#################" , data)
    }).catch((err) => {
        console.log(`error fetching Usecases for provide cloud Id : ${useCaseId} :`, err);
        res.status(500).send(err);
    });


});


module.exports = router;