const fs = require('fs');
const YAML = require('json-to-pretty-yaml');
const json = {
    "a": 1,
    "b": 2,
    "c": [
      {
        "d": "cool",
        "e": "new"
      },
      {
        "f": "free",
        "g": "soon"
      }
    ]
  };
 
const data = YAML.stringify(json);
fs.writeFile('output.yaml', data, (err) => {
    if (err)
      console.log(err);
    else {
      console.log("File written successfully\n");
      console.log("The written has the following contents:");
     
    }});
