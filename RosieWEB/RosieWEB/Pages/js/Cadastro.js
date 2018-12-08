(function (doc, window) {
    'use strict'

    const TEXT_EMPRESA = 0
    const TEXT_NOME = 1
    const TEXT_EMAIL = 2
    const TEXT_SENHA = 3
    const TEXT_CONF_SENHA = 4

    const $textEmpresa = doc.getElementById('TxtEmpresa')
    const $textNome = doc.getElementById('TxtNome')
    const $textEmail = doc.getElementById('TxtEmail')
    const $textSenha = doc.getElementById('TxtSenha')
    const $textConfSenha = doc.getElementById('TxtConfSenha')

    const $btnSalvar = doc.getElementById('btnCadastro')

    const textBoxes = [$textEmpresa, $textNome, $textEmail, $textSenha, $textConfSenha]

    const isTextBoxesValid = () => {
        textBoxes.forEach(function (txtElement, index) {
            if (txtElement.value === '') {
                switch (index) {
                    case TEXT_EMPRESA:
                        alert('Digite o Nome da Empresa!')
                        break
                    case TEXT_NOME:
                        alert('Digite o seu Nome!')
                        break
                    case TEXT_EMAIL:
                        alert('Digite o seu E-Mail!')
                        break
                    case TEXT_SENHA:
                        alert('Digite sua Senha!')
                        break
                    case TEXT_CONF_SENHA:
                        alert('Digite a confirmação da senha!')
                        break
                }
                txtElement.setAttribute('style', 'border-color: RED; color: WHITE')
            } else {
                txtElement.setAttribute('style', 'border-color: WHITE; color: WHITE')
            }
        })

        if ($textSenha.value !== $textConfSenha.value) {
            alert('A Senha de Confirmação não é igual a Senha Digitada')
            $textSenha.setAttribute('style', 'border-color: RED; color: WHITE')
            $textConfSenha.setAttribute('style', 'border-color: RED; color: WHITE')
            return false
        } else if ($textSenha.value === '' && $textConfSenha.value === '') {
            $textSenha.setAttribute('style', 'border-color: RED; color: WHITE')
            $textConfSenha.setAttribute('style', 'border-color: RED; color: WHITE')
            return false
        } else {
            $textSenha.setAttribute('style', 'border-color: WHITE; color: WHITE')
            $textConfSenha.setAttribute('style', 'border-color: WHITE; color: WHITE')
            return true
        }
    }

    const registerResponse = (response) => {
        console.log(response)
        if (response === 'Existe') {
            alert('Usuário já cadastrado')
        } else {
            alert('Usuário Cadastrado com Sucesso!')
            window.location.href = "Login.aspx";
        }
    }

    const registerError = (error) => {
        alert('Houve um erro ao registrar o Usuario! ' + error + ' envie ao suporte!')
        console.log(error)
    }

    $btnSalvar.onclick = () => {
        if (isTextBoxesValid()) {
            PageMethods.SearchAdminUser($textEmpresa.value, $textNome.value,
                $textEmail.value, $textSenha.value, $textConfSenha.value,
                registerResponse,
                registerError)
        }
        return false;
    }

})(document, window)
