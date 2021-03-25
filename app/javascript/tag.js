if (location.pathname.match("rooms/new")){
  document.addEventListener("DOMContentLoaded", () => {
    const inputElement = document.getElementById("rooms_tag_name");
    inputElement.addEventListener("keyup", () => {
      const keyword = document.getElementById("rooms_tag_name").value;
      console.log(keyword);
    });
  });
};