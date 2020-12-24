const http =
require('http')
const port =
process.env.PORT || 3000
const server =
http.createServer((req, res) => {
    const path = req.url.replace(/\/?(?:\?.*)?$/, '').toLowerCase()
    res.writeHead(200, { 'Content-Type': 'text/plain' })
    res.end('Hello world!')
})
server.listen(port, () => console.log(`server started on port ${port}; ` +
				      'press Ctrl-C to terminate....'))
