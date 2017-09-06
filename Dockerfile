FROM microsoft/aspnetcore-build AS build-env
WORKDIR /app

COPY *.csproj .
RUN dotnet restore

COPY . .
RUN dotnet publish --output /out/ --configuration Release

FROM microsoft/aspnetcore
WORKDIR /app
COPY --from=build-env /out .
ENTRYPOINT ["dotnet", "aspnetmvcapp.dll"]
