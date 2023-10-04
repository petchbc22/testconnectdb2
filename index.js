var ibmdb = require('ibm_db');

ibmdb.open("DRIVER={DB2};DATABASE=S068CE3R;HOSTNAME=170.100.190.11;UID=metroapi;PWD=metroapi;PORT=446;PROTOCOL=TCPIP", function (err,conn) {
  if (err) return console.log('err--->',err);
  else {
    console.log('success')
  }
  // conn.query('select * from staff where id = ?', [10], function (err, data) {
  //   if (err) console.log(err);

  //   console.log(data);

  //   conn.close(function () {
  //     console.log('done');
  //   });
  // });
});
