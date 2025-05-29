var builder = WebApplication.CreateBuilder(args);
var app = builder.Build();


app.MapGet("/usuario", () => new { Nome = "Renan", Idade = 36 });


app.Run();
