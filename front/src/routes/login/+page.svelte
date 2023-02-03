<script>
    let email = ""
    let senha = ""

    const Login = async () =>  {
        const authRoute = "http://localhost/provaHobbies/back/auth.php";
        let data = new FormData();
        data.append("email", email);
        data.append("senha", senha);
        const res = await fetch(authRoute, {
            body: data,
            method: "POST",
            credentials: "include",
        });
        if(!res.ok){
            alert('erro: nao foi possivel realizar o login');
        }
    };
    localStorage.setItem('isLogged', "true");
</script>



<h1>faça seu login</h1>
<form on:submit|preventDefault={Login}>
<input type="email" id="email" maxlength="45" bind:value={email}> insira seu email
    <br/>
    <br/>
    <br/>
<input type="password" id="senha" bind:value={senha}>insira sua senha
<button type="submit" id="conectar">conectar</button>
</form>
<br/>
<br/>
<br/>

<a href="/"> voltar para página inicial</a>