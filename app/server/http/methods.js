var parsePost = function(input) {
  var result = {};
  var parts = input.split("&");
  parts.forEach(function(part) {
    var divided = part.split("=");
    result[divided[0]] = divided[1];
  });
  return result;
};

HTTP.methods({
  'io/call/:userId': {
    post: function(data) {
      if (typeof data !== "undefined") {
        var post = parsePost(data.toString());
        Calls.insert({
          _id: post.callId,
          from: post.from,
          to: post.to,
          direction: post.direction,
          active: true,
          startDate: new Date(),
          endDate: null
        });
      }
      this.setContentType('application/xml');
      var response = '<?xml version="1.0" encoding="UTF-8"?>'
                    +'<Response '
                    +'onHangup="http://telefonnetz.t.proxylocal.com/io/hangup/'+this.params.userId+'">'
                    +'<!--empty request--></Response>';
      return response;
    }
  },
  'io/hangup/:userId': {
    post: function(data) {
      if (typeof data !== "undefined") {
        var post = parsePost(data.toString());
        Calls.update({ _id:post.callId },
        {
          active: false,
          endDate: new Date()
        });
      }
      this.setContentType('application/xml');
      var response = '<?xml version="1.0" encoding="UTF-8"?>'
                    +'<Response><!--empty request--></Response>';
      return response;
    }
  }
});
