//Description:
//    Responds when hearing "marco" or "Marco"
//Commands:
//    hubot hears marco - Hubot says Polo! (case insensitive)

module.exports = function(robot) {
    robot.hear(/Marco\!?/i, function(msg) {
        msg.send("Polo!");
    });
};
