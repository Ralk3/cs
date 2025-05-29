# Etapa 1: build
FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build
WORKDIR /app

# Copia apenas o csproj e faz o restore dos pacotes
COPY *.csproj ./
RUN dotnet restore

# Copia o restante e compila a aplicação
COPY . . 
RUN dotnet publish -c Release -o /out

# Etapa 2: runtime
FROM mcr.microsoft.com/dotnet/aspnet:7.0
WORKDIR /app
COPY --from=build /out .

ENTRYPOINT ["dotnet", "ApiSimples.dll"]
