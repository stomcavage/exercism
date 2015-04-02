String.prototype = {
    isQuestion: function() {
        return this.endsWith('?');
    },
    
    isSilence: function() {
        return this.trim().length === 0;
    },

    isShouting: function() {
        return this.toUpperCase() === this && this.search(/[A-Z]+/) !== -1;
    }
};

var Bob = function() {};

Bob.prototype.hey = function(input) {
    var i;
    var response = "Whatever.";
    var responseMap = {
        isSilence: "Fine. Be that way!",
        isQuestion: "Sure.",
        isShouting: "Whoa, chill out!"
    };
    for (i in responseMap) {
        if (responseMap.hasOwnProperty(i) && input[i]) {
            response = responseMap[i];
            break;
        }
    }
    return response;
};

module.exports = Bob;
