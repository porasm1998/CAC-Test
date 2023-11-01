const express = require('express');
const multer = require('multer');
const cors = require('cors');

const app = express();

app.use(cors());
app.use(express.static('public'));
let formidable = require('formidable');
const storage = multer.diskStorage({
    destination: (req, file, cb) => {
        cb(null, 'public')
    },
    filename: (req, file, cb) => {
        cb(null,file.originalname)
    }
});

const upload = multer({ storage }).array('file');


// app.post('/upload', (req, res) => {
//     upload(req, res, (err) => {
//         if (err) {
//             return res.status(500).json(err)
//         }

//         return res.status(200).send(req.files)
//     })
// });

// app.post('/upload/folder', (req, res) => {
//    // console.log(req,req.params.foldername)
//     var fs1 = require('fs'); 
//     var dir = './public/tmp';
//      if (!fs1.existsSync(dir)) { fs1.mkdirSync(dir);
//      }
//     let form = new formidable.IncomingForm();
//     //Process the file upload in Node
//     form.parse(req, function (error, fields, file) {
//         //console.log("files", file, fields)
//         //console.log(file)
//         let tempdir = ""
//         for (const [key, value] of Object.entries(file)) {
//             let fs = require('fs');
//             tempdir= ""
//             //console.log(value.originalFilename.split('/'))
//             value.originalFilename.split('/').map((element,index)=>{
//             //      tempdir=dir + "/" + element
//             //   if (!fs1.existsSync(tempdir) && index != value.originalFilename.split('/').length-1) {
//             //      fs1.mkdirSync(tempdir);
//             // }
//             if (index != value.originalFilename.split('/').length-1) {
//             tempdir =   tempdir + element + "/" 
//             }
//             })
//             if (!fs1.existsSync(dir + "/"+ tempdir)){
//                 fs1.mkdirSync(dir + "/"+ tempdir, { recursive: true });
//             }
//            console.log(tempdir)
//             // const filepath = key.split('.')[1].toLowerCase() == "json" ? "save-internally/src/jsonFile/" : "save-internally/src/fileupload/"
//             const filepath = dir + "/"+ tempdir + "/"
//             fs.readFile(value.filepath, function (err, data) {
//                 fs.writeFile(filepath + key, data, function (err) {
//                     if (err) throw err;
//                     console.log('File is created successfully.');
//                 });
//             });
//         }
//     });
// });

app.listen(3001, () => {
    console.log('App is running on port 3001')
});