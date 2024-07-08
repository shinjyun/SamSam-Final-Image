const { createProxyMiddleware } = require('http-proxy-middleware');

module.exports = function(app) {
  app.use(
    '/imgselect',
    createProxyMiddleware({
      target: 'http://localhost:8088',
      changeOrigin: true,
    })
  );
};