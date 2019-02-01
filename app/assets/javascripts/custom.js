var respostas_certas = 0;
var respostas_erradas = 0;


/*** YOUTUBE API***/
var tag = document.createElement('script');
tag.src = "https://www.youtube.com/iframe_api";
var firstScriptTag = document.getElementsByTagName('script')[0];
firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);
var player;

function onYouTubePlayerAPIReady() {
    player = new YT.Player('ytplayer', {
      height: '360',
      width: '640',
      videoId: 'sXo_ghl7NUQ',
      events: {
            'onStateChange': onPlayerStateChange
        }
    });
}

var done = false;

function onPlayerStateChange(event) {
    if (event.data == YT.PlayerState.PLAYING && !done) {
        setTimeout(stopVideo, 6000);
        done = true;
    }
}

function stopVideo() {
    player.stopVideo();
}

function simulado(){
    var answers = {};
    var questao = "";
    
    
    $(".simulado-radio li").click(function(){
        $(".simulado-radio li").removeClass();
        $(this).toggleClass('clicked'); 
    });
        
    $(".simulado-select li").click(function(){
        if ($(this).hasClass('clicked')){
            $(this).removeClass();
            console.log("hasClass");
        }else{
            $(this).toggleClass('clicked');
            console.log("nothasClass");
        }
    });

};

function comparaArray(array1, array2){
    if(array1.length == array2.length){
            return array2.every(function(element, index) {
                                return element === array1[index]; 
                            });
    }else{
        return false;
    }
}

function responderSimulado(answers){
    //$("#btn-responder").hide();
    var resposta = $("li.clicked").toArray();
    var resposta_ids = [];
    
    $('#btn-ver-resposta').prop('disabled', false);
    
    resposta.forEach(function(element){
            resposta_ids.push(parseInt(element.id));
    });
    
    answers = answers.sort();
    respostas_ids = resposta_ids.sort();

    if(comparaArray(answers,resposta_ids)){
        $('#btn-responder').prop('disabled', true);
        var img = document.getElementById('ans-right');
        img.style.visibility = 'visible';
    }else{
        $('#btn-responder').prop('disabled', true);
        var img = document.getElementById('ans-wrong');
        img.style.visibility = 'visible';
    }
}

function showAnswer(answers){
    answers.forEach(
        function(element){
             $("#"+element).css('color','green');
    });
}


$(function(){
    //Carrega editor de texto
    $('.summernote').summernote();
    //carrega simulado
    simulado();
    
    //Carrega slider banner
    $('#bootstrap-touch-slider').bsTouchSlider();
});

