"use strict";

var node = {};
node.correios = require('node-correios');

var args = {
    nCdEmpresa: '',
    sDsSenha:'',
    nCdServico: '40010',
    sCepOrigem: '04002003',
    sCepDestino: '05616000',
    nVlPeso: '0.340',
    nCdFormato: 3,
    nVlComprimento: 50,
    nVlAltura: 0,
    nVlLargura: 23,
    nVlDiametro: 0,
    sCdMaoPropria: 'N',
    nVlValorDeclarado: 0,
    sCdAvisoRecebimento: 'N'
};

var correios = new node.correios();
correios.calcPreco(args, function (err, result) {
    console.log(result);
});
 
