(function (doc, win) {
    const $email = doc.querySelector('[data-login="email"]')
    const $senha = doc.querySelector('[data-login="senha"]')

    const $login = doc.querySelector('[data-login="login"]')
    const $cadastro = doc.querySelector('[data-cadastro="cadastre"]')

    console.log($email)
    console.log($senha)
    console.log($login)
    console.log($cadastro)

    const searchUser = () => {
        PageMethods.SearchUser($email.value, $senha.value, loginResponse, loginError)
        return false;
    }

    const loginResponse = (response) => {
        console.log(response)
    }
    const loginError = (error) => {
        console.log(error)
    }

    $login.onclick = () => {
        searchUser()
        return false
    }

    $cadastro.onclick = () => {
        win.location.href = '../Pages/Cadastro.aspx'
    }

})(document, window)