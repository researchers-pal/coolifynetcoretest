FROM ://microsoft.com AS build
WORKDIR /src
COPY . .
RUN dotnet publish -c Release -o /app

FROM ://microsoft.com
WORKDIR /app
COPY --from=build /app .
EXPOSE 8080
ENTRYPOINT ["dotnet", "MyCoolifyApi.dll"]
