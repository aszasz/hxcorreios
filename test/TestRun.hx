import utest.Assert;
import correios.WebServices;
//import correios ck.W
//import correios.Pack.Shape.*
//import si.basicdim

class TestNodeCorreios {
    public function new() {}
/*
   Fr4ever contract:
- nCdEmpresa: 9912278482
- nDsSenha: 01370682
- códigos de produto no pdf PAC + SEDEX 40096?
*/
    public function test_propose(){
        /*
        var c = new correios.Client(admcode, pwd, contractedServices)
        var p = CPackEnvelope  (0.50 * m , 0.43 * m);
        var p = CPackTube (50 * cm, 12 * m);
        var p = CPAckBox (50, 14, 16);
        var s = Sedex(inHands,withReceipt,100);
        var s = Sedex() ;
        var s = SedexChargeReceiver(withReceipt, inHands, 17);
        var s = PAC();
        var cepO = correios.toCep("04562-000");
        var cepD = correios.toCep(05616);
        correios.WebServices.getDeliveryInfo(serv,p,cepO, cepD, callback );
        correios.WebServices.getDaystoDeliver(serv,cepO,cepD);
    */
        Assert.equals(1,1);
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
    trace(correios.WebServices.NotExternWebServices.getDeliveryInfo(args));

    }

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
        //var done = 
        var cws = new WebServices();
        var callback = function (err:Dynamic, result:Dynamic) {
            trace("getPrice.result=" + result);
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
            Assert.createAsync();
        };
        cws.getPrice(args,callback); 
    }
    public function test_CalcPrecoPrazo() {
        var args = {
            nCdEmpresa :"11162422",
            sDsSenha :"01370682",
            nCdServico: "40010,40045,40096",
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
        var callback = function (err:Dynamic, result:<) {
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
        cws.getDaysAndPriceToDeliver(args,callback); 
    }
    public function test_CalcPrazo() {
        var args = {
            nCdServico: "40096",
            sCepOrigem: "22280000",
            sCepDestino: "57260970",
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
                Erro : "", 
                MsgErro : "" 
            };
            Assert.is(result[0], as);
            done();
        };
        cws.getDaysToDeliver(args,callback); 
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
