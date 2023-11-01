const { Octokit } = require('../../node_modules/@octokit/core')
const config = require('config');
const { base64encode, base64decode } = require('nodejs-base64');
async function commit(userId, repoName,branch, data, location, file) {

    const gitData = Buffer.from(data).toString('base64')
    const octokit = new Octokit({ auth: `${base64decode(config.get('gitHub.Token'))}` });
    try {
        console.log(branch,"inside gitapi");
        const response = await octokit.request(`PUT /repos/${userId}/${repoName}/contents/${location}/${file}`, {
            "message": "github api",
            "content": `${gitData}`,
            "branch" : `${branch}`
        })
        console.log(response);
        return response
    } catch (error) {
        console.log(error);
        return error
    }
}



module.exports = { commit }