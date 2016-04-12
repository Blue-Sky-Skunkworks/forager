var express = require('express');
var app = express();
var bodyParser = require('body-parser');
var passport = require('passport');
var mongoose = require('mongoose');
var uriUtil = require('mongodb-uri');

var options = {
server:  { socketOptions: { keepAlive: 1, connectTimeoutMS: 30000 } },
replset: { socketOptions: { keepAlive: 1, connectTimeoutMS: 30000 } }
};  

var mongodbUri = process.env.MONGOLAB_URI || "mongodb://localhost/forageposts";
var mongooseUri = uriUtil.formatMongoose(mongodbUri);
console.log(mongodbUri);

mongoose.connect(mongooseUri, options);

var router = express.Router();
var port = process.env.PORT || 8080;
var floraRoutes = require('./routes/flora');
var userRoutes = require('./routes/user');
var session = require('express-session');
var flash = require('connect-flash');

app.use(express.static('public'));

app.set('view engine', 'ejs');

app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

app.use(flash());
app.use(session({ secret: 'ilovescotchscotchyscotchscotch' })); // session secret
app.use(passport.initialize());
app.use(passport.session()); // persistent login sessions
app.use(session({
cookie: {
  maxAge: 60000
}
}));

require('./config/passport')(passport);
require('./routes/user.js')(app, passport);

app.use(function(req, res, next) {
    var user = req.user || "no user";
    console.log(user);
    next();
});

app.get('/', function(req, res){
    var user = req.user || "no user";
    res.render('index', {user: user})
});

app.get('/submitForage', function(req, res){
    var user = req.user || "no user";
    console.log(user)
    res.render('submitForage', {user: user})
});

app.get('/contact', function(req, res){
    var user = req.user || "no user";
    res.render('contact', {user: user})
});

// app.get('/login', function(req, res){
//   console.log("user at login: ")
// 	var user = req.user || "no user";
//   res.render('login', {user: user})
// });

app.use('/api/flora', floraRoutes);

// app.delete('/api/flora/:id', function(req, res){
//     var id = Number(req.params.id); 
//     var deleteFlora = '';

//     flora.forEach(function(flora){
//         if(flora.id === id){
//             deleteFlora = flora;
//         var index = flora.indexOf(deleteFlora);
//             flora.splice(index, 1);
//         }
//     });
//     res.json(deleteFlora);
// })


app.listen(port, function(req, res){
  console.log('App is running on ' + port + '.')
});