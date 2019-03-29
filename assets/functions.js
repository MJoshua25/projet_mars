function success(result) {
    return{
        status : "success",
        result : result
    }
}

function error(message) {
    return{
        status: "error",
        message: message
    }
}

function isErr(err){
    return err instanceof Error
}

function checkAndChange(obj){
    if(isErr(obj))
        return error(obj.message)
    else
        return success(obj)
}

exports.success = success;
exports.error = error;
exports.isErr = isErr;
exports.checkAndChange = checkAndChange;
