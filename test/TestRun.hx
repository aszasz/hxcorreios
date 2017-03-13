import utest.Assert;
import correios.WebServices;

class TestNodeCorreios {
    public function new() {}
/*
   Fr4ever contract:
- nCdEmpresa: 9912278482
- nDsSenha: 01370682
- códigos de produto no pdf PAC + SEDEX 40096?
*/

    public function test_CalcPreco()
        {
        var args = {
            nCdEmpresa :"11162422",
            sDsSenha :"01370682",
            nCdServico: "40096",
            sCepOrigem: "04002003",
            sCepDestino: "05616000",
            nVlPeso: "0.340",
            nCdFormato: 3,
            nVlComprimento: 50,
            nVlAltura: 0,
            nVlLargura: 23,
            nVlDiametro: 0,
            sCdMaoPropria: "N",
            nVlValorDeclarado: 0,
            sCdAvisoRecebimento: "N"
        };
        var done = Assert.createAsync(); 
        var cws = new WebServices();
        var callback = function (err:Dynamic, result:Dynamic) {
            trace("CalcPreco.result=" + result);
            Assert.same(result[0].Valor,"17,20");
            var tdef : PriceResponseData  = {
            Codigo: 0, 
            Valor: "", 
            ValorMaoPropria: "", 
            ValorAvisoRecebimento: "", 
            ValorValorDeclarado : "", 
            Erro : "", 
            MsgErro : "", 
            ValorSemAdicionais : ""
            };
            Assert.is(result[0], tdef);
            done();
        };
        cws.calcPreco(args,callback); 
    }
    public function test_CalcPrecoPrazo() {
        var args = {
            nCdEmpresa :"11162422",
            sDsSenha :"01370682",
            nCdServico: "40096",
            sCepOrigem: "04002003",
            sCepDestino: "05616000",
            nVlPeso: "0.340",
            nCdFormato: 3,
            nVlComprimento: 50,
            nVlAltura: 0,
            nVlLargura: 23,
            nVlDiametro: 0,
            sCdMaoPropria: "N",
            nVlValorDeclarado: 0,
            sCdAvisoRecebimento: "N"
        };
        var done = Assert.createAsync(); 
        var cws = new WebServices();
        var callback = function (err:Dynamic, result:Dynamic) {
            trace("calcPrazoPreco.result" + result);
            var as = {
                Codigo : 0 ,
                PrazoEntrega : "", 
                EntregaDomiciliar : "", 
                EntregaSabado : "", 
                Valor: "", 
                ValorSemAdicionais : "",
                ValorMaoPropria: "", 
                ValorAvisoRecebimento: "", 
                ValorValorDeclarado : "", 
                Erro : "", 
                MsgErro : "" 
            };
            Assert.is(result[0], as);
            done();
        };
        cws.calcPrecoPrazo(args,callback); 
    }
}

class TestRun {
	static function main()
	 {
        trace("Hello World!");
		var r = new utest.Runner();
		r.addCase(new TestNodeCorreios());
		utest.ui.Report.create(r);
        r.run();
        trace("Goodbyeworld!"); //never gets here!
	}
}
