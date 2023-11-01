const express = require("express");
const { FILE_PATH } = require("../constant/apiConstant");
const router = express.Router();
const { prepareAndGetQuery, getModel } = require("../common/queryUtil");
const Usecases = require("../../model/usecases");
const UsersUseCases = require('../../model/usersUseCase');
const formidable = require("formidable");
const uploadFile = require("../middleware/fileUpload");
const path = require("path");
var child_process = require('child_process');
const AdmZip = require("adm-zip");
const { commit } = require('../common/githubApi')
const StandardControls = require("../../model/standardControls");
fs = require("fs");
const dir = "/public/";
const Users = require('../../model/users');
const { Op } = require("sequelize");


router.get("/", (req, res) => {
  const query = prepareAndGetQuery(req, ["cloud", "useCase"]);
  Usecases.findAndCountAll(query)
    .then((data) => {
      res.status(200).send(data);
    })
    .catch((err) => {
      console.log("error fetching Usecases table : ", err);
      res.status(500).send(err);
    });
});

router.get("/cloud/:cloudId", (req, res) => {
  const { cloudId } = req.params;
  const query = {
    where: { ["cloudId"]: cloudId },
    include: [getModel("useCase")],
  };
  Usecases.findAll(query)
    .then((data) => {
      res.status(200).send(data);
    })
    .catch((err) => {
      console.log(
        `error fetching Usecases for provide cloud Id : ${cloudId} :`,
        err
      );
      res.status(500).send(err);
    });
});

router.post("/", (req, res) => {
  Usecases.create(req.body)
    .then((data) => {
      res.status(200).send(data);
    })
    .catch((err) => {
      console.log("error inserting into Usecases table :", err);
      res.status(500).send(err);
    });
});

router.put("/:useCaseId", (req, res) => {
  const { useCaseId } = req.params;
  Usecases.update(req.body, { where: { useCaseId } })
    .then((data) => {
      res.status(200).send(data);
    })
    .catch((err) => {
      console.log("error updating Usecases table :", err);
      res.status(500).send(err);
    });
});

router.delete("/:useCaseId", (req, res) => {
  const { useCaseId } = req.params;
  Usecases.destroy({ where: { useCaseId: parseInt(useCaseId) } })
    .then(() => {
      res.sendStatus(200);
    })
    .catch((err) => {
      console.log("error deleting record from Usecases table :", err);
      res.status(500).send(err);
    });
});
async function extractArchive(filepath, rootPath) {
  try {
    const zip = new AdmZip(filepath);

    const outputDir = path.join(__dirname, "..", `${rootPath}`);

    zip.extractAllTo(outputDir);

    console.log(`Extracted to "${outputDir}" successfully`);
  } catch (e) {
    console.log(`Something went wrong. ${e}`);
  }
}

async function findPath(cloudId, categoryName, name) {
  return await StandardControls.findOne({
    where: {
      [Op.and]: [
        { cloudId: cloudId },

        { categoryName: categoryName },

        { name: name },
      ],
    },

    order: [["serialNo", "ASC"]],
  })

    .then((data) => {
      //   console.log(data.name);

      return data.value;
    })

    .catch((err) => {
      console.log("error fetching Cloud Standards table : ", err);
    }); //   console.log(data);
}

router.post(
  "/upload/file",

  uploadFile(FILE_PATH.TF_FILE).single("zip"),

  (req, res) => {
    const pathUrl = path.join(
      __dirname,

      "..",

      `${FILE_PATH.TF_FILE}${req.file.filename}`
    );

    const fileName = path.parse(req.file.originalname).name;

    fields = req.body;
  

    findPath(fields.cloudId, "Dynamic_UI", FILE_PATH.TF_ROOT_PATH).then(
      function (rootPath) {
        const extractTo = `${rootPath}${fields.name}/`;
        extractArchive(pathUrl, extractTo);

        const usecaseData = {
          cloudId: fields.cloudId,
          name: fields.name,
          parentId: fields.parentId,
          JSON_File_Path: `${rootPath}${fields.name}/${fileName}/form.json`,
          TF_File_Path: `${rootPath}${fields.name}/${fileName}/terraform`,
        };

        Usecases.create(usecaseData)

          .then((data) => {
            // const zipFile = fs.readFileSync(pathUrl).toString();
            // commit("cloudAuto9","terraform_2.0","main",pathUrl,`requests`,`${data.useCaseId}.zip`)
            const { exec } = require('child_process');
            var yourscript = exec('sh commit.sh',
              (error, stdout, stderr) => {
                console.log(stdout);
                console.log(stderr);
                if (error !== null) {
                  console.log(`exec error: ${error}`);
                }
              });
            res.status(200).send(data);

          })

          .catch((err) => {
            console.log("error inserting into Clients table :", err);

            res.status(500).send(err);
          });

      }
    );
  }
);

router.get('/dynamic/:userId', (req, res) => {
  const { userId } = req.params;

    Usecases.findAll({
      include: [
        {
          model: UsersUseCases,
          where: { userId: userId },
          as: 'uu1',
        },
      ],
      where: {
        JSON_File_Path: {
          [Op.ne]: null,
        },
      },
    })
  
  
  .then((data) => {
    console.log('data',data);
    res.status(200).send(data);
  })
  .catch((err) => {
    console.error(
      `error fetching Usecases for provide cloud Id : ${userId} :`,

      err
    );

    res.status(500).send({error: 'Internal server error'});
  });
});

// router.get("/dynamic/:cloudId", (req, res) => {
//   const { cloudId } = req.params;
//   const { userId}  = req.params;

//   const query = {
//     where: {
//       [Op.and]: [{ cloudId: cloudId }, { TF_File_Path: { [Op.ne]: null } }],
//     },
//   };

  
  
//   const query1 = {
//     include: [
//       {
//         model: UsersUseCases,
//         where: { userId: userId}
//       }
//     ]
//   }
  
//   Usecases.findOne(query1)

//     .then((data) => {
//       res.status(200).send(data);
//     })

//     .catch((err) => {
//       console.log(
//         `error fetching Usecases for provide cloud Id : ${userId} :`,

//         err
//       );

//       res.status(500).send(err);
//     });
// });

async function get_form(path) {
  const rawdata = await fs.readFileSync(path);

  return JSON.parse(rawdata);
}

router.get("/form/:useCaseId", (req, res) => {
  const { useCaseId } = req.params;
  console.log("usecaseid......", useCaseId);
  Usecases.findOne({
    where: {
      useCaseId: useCaseId,
    },
  }).then((data) => {
    const outputDir = path.join(__dirname, "..", `${data.JSON_File_Path}`);
    get_form(outputDir).then((data) => {
      res.send(data);
    });
  });
});




router.get("/test", (req, res) => {
  const child = child_process.fork(`api/common/jenkins.js`, [])
  child.on('message', (error) => {
    console.log(error);
  })
  res.status(200).send(child);

});

module.exports = router;
