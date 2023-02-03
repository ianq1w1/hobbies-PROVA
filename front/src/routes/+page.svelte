<script>
    import { onMount } from "svelte";

    let isLogged = ""
    let Hobby = [];

    onMount(() => {
      console.log(isLogged = localStorage.getItem("isLogged"));
      readHobby();
    })
   
    const logout = async () => {
     fetch("http://localhost/provaHobbies/back/logout.php", {
      credentials: "include",
    });
    localStorage.removeItem("isLogged");
    location.reload();
  };

    const readHobby = async () => {
      const readRoute = "http://localhost/provaHobbies/back/read-hobbie.php";
      const res = await fetch(readRoute,{
        credentials: "include"
      });
      Hobby = await res.json();
    };


    const deleteHobbie = async (id) => {
      const deleteRoute = "http://localhost/provaHobbies/back/delete-hobbie.php";
      let data = new FormData();
      data.append("id", id);
      const res = await fetch(deleteRoute,{
        body: data,
        method: "POST",
        credentials: "include",
      });
      readHobby();
    }
</script>

<h1>Hobbies Malucos (com todo respeito)</h1>

<a href="/cadastro">entra no cadastro mano</a>
<br/>
<br/>
<br/>
<a href="/login">já está cadastrado? Realize seu login</a>
<br/>
<br/>
<br/>
{#if isLogged != "true"}
<p>nao estás logado </p>
{:else}
<p> <a href="/pHobbies">pagina de hobbies aqui, acesse!!</a></p>
<button on:click={logout}>logout</button>
<br/>
<br/>
<br/>
{#each Hobby as hobbie}
<h2> aqui estão seus hobbies registrados</h2>
<div>
 NOME DO HOBBIE: {hobbie.HOBBIE_NOME}
 DESCRIÇÃO DO HOBBIE:  {hobbie.HOBBIE_DESCRICAO}
 FREQUENCIA DO HOBBIE: {hobbie.HOBBIE_FREQUENCIA}
</div>
<button on:click={deleteHobbie(hobbie.HOBBIE_ID)}>deleletar</button>
{/each}
{/if}
