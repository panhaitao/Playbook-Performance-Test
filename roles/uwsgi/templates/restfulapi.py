#!/usr/bin/env python
# -*- coding: utf-8 -*-

import flask, json
from flask import Flask, abort, request, jsonify
 
app = Flask(__name__)
 
@app.route('/login', methods=['get', 'post'])
def login():
    username = request.values.get('name')
    pwd = request.values.get('pw')
    # 判断用户名、密码都不为空，如果不传用户名、密码则username和pwd为None
    if username and pw:
        if username=='xiaoming' and pw=='xxx':
            resu = {'code': 200, 'message': '登录成功'}
            return json.dumps(resu, ensure_ascii=False)
        else:
            resu = {'code': -1, 'message': '账号密码错误'}
            return json.dumps(resu, ensure_ascii=False)
    else:
        resu = {'code': 10001, 'message': '参数不能为空！'}
        return json.dumps(resu, ensure_ascii=False)
 
@app.route('/name', methods=['get', 'post'])
def name():
    username = request.values.get('name')
    resu = {'code': 200, 'message': username }
    return json.dumps(resu, ensure_ascii=False)
 
@app.route('/pw', methods=['get', 'post'])
def pw():
    password = request.values.get('pw')
    resu = {'code': 200, 'message': password }
    return json.dumps(resu, ensure_ascii=False)
 
if __name__ == '__main__':
    app.run(debug=True, port=999, host='127.0.0.1')
