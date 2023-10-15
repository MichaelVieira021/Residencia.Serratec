// caso o usuario já tenha acesso ele será redirecionado para dsfechado
if (localStorage.getItem("acesso") === "true") {
    //window.open("login.html", "_self")
        
    window.location.href = "../paginas/ds-fechado.html"
}

function logar() {

    const email = document.getElementById("email").value;
    const senha = document.getElementById("senha").value;

    // se não existir a key usuario no localstorage o acesso é imediatamente recusado
    // e uma mensagem generica é posta no lugar
    if(!localStorage.usuario){
        alert('Email ou senha incorretos!')
        return false 
    }
    // este comando pega o vetor de usarios no local storage
    const vetorUsuario = JSON.parse(localStorage.getItem('usuario'));
    
    // foreach percorre todo o vetor checando se o usuario esta cadastrado
    for (let usuario of vetorUsuario) {
        if (usuario.email === email && usuario.senha === senha) {
            
            // guarda o nome do usuario atual
            localStorage.setItem("usuarioLogado",usuario.nome)
            
            // define que o usario atual tem acesso
            localStorage.setItem("acesso", true)
            
            return true
        }
    }
    
    alert('Usuario ou senha incorretos!')
    return false 
}

