'use strict';

module.exports = function(app) {
  const services = require('../controllers/resumeController');
  
  app.get('/resume/title', services.title);
  app.get('/resume/contact', services.contact);
  app.get('/resume/apps', services.apps);
  app.get('/resume/skills', services.skills);  
  app.get('/resume/education', services.education);      
};
