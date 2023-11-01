const processOutputFileAndGetResourceDetails = (data, requestId) => {

    const output = data.split(/(Outputs:|==> Builds finished)/)[2];

    const resourceInfoList = output?.split('\n').filter((row) => {
        if (/^"arn/.test(row.trim())) return true;
        return row.split("=").length > 1;
    }).map(i => {
        if (/^"arn/.test(i.trim())) return `dummy = ${i}`;
        return i;
    })
        .filter((row) => {
            const [_, value] = row.split('=');
            return (/^"arn/.test(value.trim()) || /^arn/.test(value.trim()));
        }).map((row) => {
            const [_, value] = row.split('=');
            const tokens = value.split(':');
            let resourceType = '';
            let resourceDescription = '';
            if (tokens.length > 6) {
                resourceType = tokens[5];
                resourceDescription = tokens[6].replace(/\r/g, '');
            } else if (tokens.length <= 6) {
                const subTokens = tokens[5]?.replace(/\r/g, '').split('/');
                if (subTokens.length > 1) {
                    resourceType = subTokens[0];
                    resourceDescription = subTokens[1];
                } else {
                    resourceType = tokens[2];
                    resourceDescription = subTokens[0];
                }
            }
            return {
                resourceType,
                resourceDescription,
                resourceCount: 1,
                requestId
            }
        });
    return resourceInfoList;
}

module.exports = { processOutputFileAndGetResourceDetails }