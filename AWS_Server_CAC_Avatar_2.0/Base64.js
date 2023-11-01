const { base64encode, base64decode } = require('nodejs-base64');

let encoded = base64encode(''); // "aGV5ICB0aGVyZQ=="
let decoded = base64decode('cy5LUUp5QVpxVkllSG9uQ25SdzNaTTZYdnM='); // "hey there"
console.log(encoded);
console.log(decoded);