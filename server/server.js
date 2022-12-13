const fs = require('fs');
const http = require('http');
const express = require('express');
const app = express();
const port = process.env.PORT || 6001;
const bodyParser = require('body-parser');
const querystring = require('querystring');
const cors = require('cors');
	
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());


//Web-site routes (only accessible by PHP front-end code)/////////////////////////////////////////////////////
const router = express.Router();
const routes = require('./api/routes/resume');

router.use(cors());

/*internalRouter.use(function(req, res, next) { 
    const isLocal = (req.connection.localAddress === req.connection.remoteAddress);
    if(!isLocal) {
        res.status(401).send('Illegal access to this API');        
    } else {
        next();
    }
});*/

routes(router);
app.use('/', router);


http.createServer({
}, app).listen(port);

console.log('Resume server started on: ' + port + '\n');
