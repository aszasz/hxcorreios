import utest.Assert;
import correios.WebServices;

class Test {
    function new () {}

    static function test() 
        {
        var args = {
            nCdEmpresa :"",
            sDsSenha :"",
            nCdServico: "40010",
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
        var cws = new WebServices();
        trace (cws);
        var callback = function (err:Dynamic, result:Dynamic) {
            trace("hi result=" );
            Assert.same(result.Valor,"17,20"); 
        };
        trace (callback);
        cws.calcPreco(args, callback);
        trace ("done");
    }
	static function main()
	 {
		trace("Hello World");
		var r = new utest.Runner();
		r.addCase(new Test());
		utest.ui.Report.create(r);
		r.run();
        trace("Good bye World");
	}
}
