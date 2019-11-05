var Mock = require("mockjs");

module.exports = [{
    url: "/",
    run(req,res,next) {
        var rs = {
            'status': 20000,
            'rows|1-9': [{
                'key|+3': 9,
                'province': '@province',
                'Content|1': ['@cparagraph', '@url', '@color', '@name', 'C5', 'C6'],
                'title': '@title',
                'name': '@first @last',
                'email': '@email', 'date': '@datetime', 'score': '@natural(33,99)', 'nick': '@cname'
            }
            ]
        }

        rs = Mock.mock(rs);
        res.json(rs);
    }
}]