FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build
COPY RecipeApplication/*.csproj ./app/RecipeApplication/
WORKDIR /app/RecipeApplication
RUN dotnet restore
# RUN dotnet add package Microsoft.EntityFrameworkCore.Design -v=5.0
# RUN dotnet add package Microsoft.EntityFrameworkCore.Tools.DotNet -v=2.0
# RUN dotnet tool install dotnet-ef -v=2.1

#COPY migratedatabase.sh ./
#RUN chmod +x ./migratedatabase.sh
#RUN ./migratedatabase.sh

COPY RecipeApplication/. ./
RUN dotnet publish -o out /p:PublishWithAspNetCoreTargetManifest="false"

FROM mcr.microsoft.com/dotnet/aspnet:5.0 AS runtime
ENV ASPNETCORE_URLS http://+:80
WORKDIR /app
COPY --from=build /app/RecipeApplication/out ./
ENTRYPOINT ["dotnet", "RecipeApplication.dll"]
