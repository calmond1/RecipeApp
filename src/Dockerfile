FROM microsoft/dotnet:2.0-sdk AS build
COPY RecipeApplication/*.csproj ./app/RecipeApplication/
WORKDIR /app/RecipeApplication
RUN dotnet restore
RUN dotnet add package Microsoft.EntityFrameworkCore.Design -v=2.1
# RUN dotnet add package Microsoft.EntityFrameworkCore.Tools.DotNet -v=2.0
# RUN dotnet tool install dotnet-ef -v=2.1

#COPY migratedatabase.sh ./
#RUN chmod +x ./migratedatabase.sh
#RUN ./migratedatabase.sh

COPY RecipeApplication/. ./
RUN dotnet publish -o out /p:PublishWithAspNetCoreTargetManifest="false"

FROM microsoft/dotnet:2.0-runtime AS runtime
ENV ASPNETCORE_URLS http://+:80
WORKDIR /app
COPY --from=build /app/RecipeApplication/out ./
ENTRYPOINT ["dotnet", "RecipeApplication.dll"]
