const { defineConfig } = require('@vue/cli-service')
module.exports = defineConfig({
  transpileDependencies: true,
  devServer: {
    proxy: {
        '/V1': {
            target: 'http://localhost:9090',
            changeOrigin: true,
            pathRewrite: {
                '^/V1': ''
            }
        },
        '/V2': {
            target: 'https://source.unsplash.com',
            changeOrigin: true,
            pathRewrite: {
                '^/V2': ''
            }
        },
        
    }
})
