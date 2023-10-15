
//============== variaveis ==============

// body
const nintendo = document.querySelector("#body")

// setas
const setaUp = document.querySelector(".fa-angle-up")
const setaRight = document.querySelector(".fa-angle-right")
const setaLeft = document.querySelector(".fa-angle-left")
const setaDown = document.querySelector(".fa-angle-down")

// botoes
const blueBtn = document.getElementById('blue-btn')
const greenBtn = document.getElementById('green-btn')
const redBtn = document.getElementById('red-btn')
const yellowBtn = document.getElementById('yellow-btn')

// start e select
const start = document.getElementById('start-btn')
const select = document.getElementById('select-btn')
const home = document.getElementById('home-btn')

// telas
const telaCima = document.getElementById('top-screen')
const telaBaixo = document.getElementById('bottom-screen')
const formTelaBaixo = document.getElementById('formTelaBaixo')

// input de cor
const color = document.getElementById("color")

// alto-falantes
const altoEsquerdo = document.getElementById('right-speaker')

// audios
const audio = document.getElementById('sound-track')
const som_click = document.getElementById('sound-click')
const som_btn = document.getElementById('sound-btn')

// luz de ativação
const luz = document.getElementById('light-3')

// botao de sair
const btnX = document.querySelector('.fa-x')

// menu
const menu = document.getElementById('menu')

// icon para abrir menu
const btnIcon = document.getElementById('btn-icon')

// informacoes do pokemon
const infoPokemon = document.getElementById('infoTelaBaixo')

// tipo do pokemon
const tipoPokemon = document.querySelector(".tipoIcon")

// quadro de avatares
const avatarOptions = document.getElementById('avatar-options')

// avatar atual
const avatarAtual = document.getElementById('avatar')
const nomeUsuario = document.getElementById('nameUser')

// opções de avatares
const avatarMasculino = document.getElementById('avatarMale')
const avatarFeminino = document.getElementById('avatarFemale')

// variaveis globais
let volumeAtual
let apiStart = false
let dsLigado = false
let shiny = false
let costas = false

//============== Eventos ==============

// evento que liga a tela
home.addEventListener('click', () => {
    som_btn.play()

    telaCima.classList.toggle('off')
    telaBaixo.classList.toggle('off')

    // volume audio padrão
    audio.volume = .2
    som_click.volume = .7

    // se a tela de cima tiver a classe 'off' o audio pausa senao ele toca
    if (telaCima.classList.contains('off')) {
        // para e reseta a musica
        audio.pause()
        audio.currentTime = 0

        // esconde todas as informações
        imgPokemon.style.display = 'none'
        nomePokemon.style.display = 'none'
        infoPokemon.style.display = 'none'
        tipoPokemon.style.display = 'none'
        luz.style.background = '#7a7e7d'
        pesquisaPokemon.style.visibility = 'hidden'
        
        // faz as imagens da tela de cima e da tela de baixo se tornarem as padrões
        telaCima.style.background = "url('/conteudo/imgs/foto-pag-inicial.jpg') center"

        telaBaixo.style.background = "url('/conteudo/imgs/gif-pikachu.gif') center "

        telaCima.style.backgroundSize = 'cover'
        telaBaixo.style.backgroundSize = 'cover'

        apiStart = false
        dsLigado = false
    } else {
        audio.play()

        volumeAtual = 2
        dsLigado = true
        luz.style.background = 'green'
    }    
})

// evento que inicia a api
start.addEventListener('click', () => {
    som_btn.play()
    
    // verifica se a tela de cima esta ligada
    if (dsLigado) {
        // faz aparecer as tela de cima e de baixo
        imgPokemon.style.display = 'block'
        nomePokemon.style.display = 'block'
        tipoIcon.style.display = 'block'
        infoPokemon.style.display = 'block'
        tipoPokemon.style.display = 'block'

        // define a nova imagem de cima e de baixo
        telaCima.style.background = "url('../conteudo/imgs/pixelArtTelaCima.gif')"
        telaCima.style.backgroundSize = 'cover'
        
        telaBaixo.style.background = 'linear-gradient(to bottom, rgb(43, 42, 42), rgb(27, 27, 27))'
        telaBaixo.style.backgroundSize = 'cover'

        telaBaixo.style.boxShadow = "inset 0 0 10px black"

        // mostrar a pesquisa e os stats
        pesquisaPokemon.style.visibility = 'visible'

        shiny = false
        costas = false
        apiStart = true

        exibirPokemon(1);
    }
})

// botao de select
select.addEventListener('click', () => {
    som_btn.play()
})

// evento que abre as opcoes de avatar
avatarAtual.addEventListener('click', () => {
    som_btn.play()

    avatarOptions.classList.toggle('open')
})

// evento que troca o avatar para masculino
avatarMasculino.addEventListener('click', () => {

    som_btn.play()

    avatarAtual.style.background = 'white url(../conteudo/imgs/avatar-masculino.webp) center'
    avatarAtual.style.backgroundSize = 'cover'

    avatarOptions.classList.toggle('open')
})

// evento que troca o avatar para feminino
avatarFeminino.addEventListener('click', () => {

    som_btn.play()

    avatarAtual.style.background = 'white url(../conteudo/imgs/avatar-feminino01.webp) center'
    avatarAtual.style.backgroundSize = 'cover'

    avatarOptions.classList.toggle('open')
})

//input de pesquisa
formTelaBaixo.addEventListener("submit", (event) => {
    event.preventDefault()

    som_btn.play()
    
    exibirPokemon(pesquisaPokemon.value)
    pesquisaPokemon.value = ""
})

// evento que troca as cores do nintendo
color.addEventListener("input", () => {
    nintendo.style.background = color.value
})

// botao A
yellowBtn.addEventListener('click', () => {

    som_btn.play()

    if(dsLigado && apiStart) {
        
        if (!shiny) {
            shiny=true   
        } else {
            shiny=false
        }
    
        exibirPokemonVersoes(shiny, costas)
    }
})

// botao X
blueBtn.addEventListener('click', () => {

    som_btn.play()

    if(dsLigado && apiStart) {

        if (costas) {
            costas = false
        } else {
            costas = true
        }

        exibirPokemonVersoes(shiny,costas)
    }
})

// botao Y
greenBtn.addEventListener('click', () => {
    
    som_btn.play()

    if(dsLigado && apiStart) {

        if (costas) {
            costas = false
        } else {
            costas = true
        }

        exibirPokemonVersoes(shiny,costas)
    }
})

// botao B
redBtn.addEventListener('click', () => {

    som_btn.play()

    if(dsLigado && apiStart) {
        
        if (!shiny) {
            shiny=true   
        } else {
            shiny=false
        }
    
        exibirPokemonVersoes(shiny, costas)
    }
})

// evento de clique na seta pra cima
setaUp.addEventListener('click', () => {
    som_click.play()
    
    if (dsLigado) {
        aumentarVolume()
    }
})

// evento de clique na seta pra direita
setaRight.addEventListener('click', () => {
    som_click.play()

    if (dsLigado && apiStart) {
        costas = false
        shiny = false

        proxPokemon()
    }
})

// evento de clique na seta pra baixo
setaDown.addEventListener('click', () => {
    som_click.play()
    
    if (dsLigado) {
        diminuirVolume()
    }
})

// evento de clique na seta pra esquerda
setaLeft.addEventListener('click', () => {
    som_click.play()

    if (dsLigado && apiStart) {
        costas = false
        shiny = false

        prevPokemon()
    }
})

// evento que fecha o menu
btnX.addEventListener('click', () => {
    som_btn.play()

    menu.classList.remove('open')
    avatarOptions.classList.remove('open')
})

// evento que abre o menu
btnIcon.addEventListener('click', () => {
    som_btn.play()

    menu.classList.add('open')
})

//================ Funções ================ 

buscarNomeUsuario()

// função que aumenta o volume
function aumentarVolume() {
    
    // a verificação vai de 0 até 10
    if (volumeAtual < 10) {

        volumeAtual++
        // e volume vai de 0 até 1, por isso é precisa dividir por 10
        let volumeCorrigido = (volumeAtual /10)
        
        audio.volume = volumeCorrigido
    }
}

// função que diminui o volume
function diminuirVolume() {

    if(volumeAtual > 0) {
        
        volumeAtual--
        let volumeCorrigido = (volumeAtual/10)
        audio.volume = volumeCorrigido
    }
}

//recebe o nome da pessoa
function buscarNomeUsuario() {
    const usuarioLogado = localStorage.getItem("usuarioLogado")

    nomeUsuario.innerHTML = usuarioLogado
}