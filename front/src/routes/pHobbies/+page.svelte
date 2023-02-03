<script>

let nome = ""
let descricao = ""
let frequencia = ""

const CreateHobby = async () => {
    const CreateHobbyRoute = "http://localhost/provaHobbies/back/create-hobby.php";
    let data = new FormData();
    data.append("nome", nome);
    data.append("descricao", descricao);
    data.append("frequencia", frequencia);
    const res = await fetch(CreateHobbyRoute,{
        body: data,
        method: "POST",
        credentials: "include",
    });
    if(!res.ok){
            alert('erro: nao foi possivel postar seu hobby esquisito');
        }

}


</script>

<h1>coloque seus hobbies aqui, e se você não tem nenhum... (oque você está fazendo da vida afinal???)</h1>


<form on:submit|preventDefault={CreateHobby}>
<input type="text" id="Hnome" bind:value={nome} maxlength="45"> Nome do seu hobby
<br/>
<br/>
<br/>
<input style="width: 300px;"type="text" id="Hdescricao" bind:value={descricao}>descreva seu hobby
<br/>
<br/>
<br/>
<input type="text" id="Hfrequencia" bind:value={frequencia} style="height: 90px;width:300px"> com que frequencia voce faz este hobby
<button type="submit">envie aqui o seu hobbie</button>
</form>

<a href="/"> voltar para pagina principal</a>
