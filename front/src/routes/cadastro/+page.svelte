<script>
    import { dataset_dev } from "svelte/internal";


    let nome = ""
    let email = ""
    let senha = ""

    const Cadastro = async () => {
        const cadastroRoute = "http://localhost/provaHobbies/back/create-user.php";
        let data = new FormData();
        data.append("nome", nome);
        data.append("email", email);
        data.append("senha", senha);
         fetch(cadastroRoute,{
            body: data,
            method: "POST",
        });
    };
</script>

<h1>este é o cadastro</h1>
<form on:submit|preventDefault={Cadastro}>
<input type="text" id="nome" maxlength="45" bind:value={nome}> insira seu nome
    <br/>
    <br/>
<input type="email" id="email" maxlength="45" bind:value={email}> insira seu email
    <br/>
    <br/>    
<input type="password" id="senha" bind:value={senha}> insira sua senha
<button type="submit" id="confirmar">confirmar cadastro</button>
</form>
    <br/>
    <br/>
<a href="/"> voltar para pagina inicial</a>