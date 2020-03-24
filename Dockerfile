#Depending on the operating system of the host machines(s) that will build or run the containers, the image specified in the FROM statement may need to be changed.
#For more information, please see https://aka.ms/containercompat

FROM mcr.microsoft.com/dotnet/core/aspnet:2.2-nanoserver-1809 AS base
WORKDIR /app
EXPOSE 80

FROM mcr.microsoft.com/dotnet/core/sdk:2.2-nanoserver-1809 AS build
WORKDIR /src
COPY ["dockertraining_esteban_barron/dockertraining_esteban_barron.csproj", "dockertraining_esteban_barron/"]
RUN dotnet restore "dockertraining_esteban_barron/dockertraining_esteban_barron.csproj"
COPY . .
WORKDIR "/src/dockertraining_esteban_barron"
RUN dotnet build "dockertraining_esteban_barron.csproj" -c Release -o /app

FROM build AS publish
RUN dotnet publish "dockertraining_esteban_barron.csproj" -c Release -o /app

FROM base AS final
WORKDIR /app
COPY --from=publish /app .
ENTRYPOINT ["dotnet", "dockertraining_esteban_barron.dll"]