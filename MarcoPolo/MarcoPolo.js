//Description:
//    Replies to "marco" or "Marco"
//Commands:
//    hubot marco - Reply with Polo! (case insensitive) 

module.exports = function(robot) {
    robot.hear(/Marco/i, function(msg) {
        msg.reply("Polo!");
    });
};
