(function (doc, win) {
    const $email = doc.querySelector('[data-login="email"]')
    const $senha = doc.querySelector('[data-login="senha"]')

    const $login = doc.querySelector('[data-login="login"]')
    const $cadastro = doc.querySelector('[data-cadastro="cadastre"]')

    const searchUser = () => {
        PageMethods.SearchUser($email.value, $senha.value, loginResponse, loginError)
        return false;
    }

    const loginResponse = (response) => {
        win.location.href = '../Pages/Dashboard.aspx'
    }
    const loginError = (error) => {
        alert('Ocorreu um erro na requisição' + error)
    }

    $login.onclick = () => {
        searchUser()
        return false
    }

    $cadastro.onclick = () => {
        win.location.href = '../Pages/Cadastro.aspx'
    }

})(document, window)