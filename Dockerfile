FROM mcr.microsoft.com/dotnet/sdk:6.0-alpine3.18 as build
WORKDIR /app
COPY . .
RUN dotnet publish -o wasm-published

FROM nginx:1.25-alpine
COPY --from=build /app/wasm-published/wwwroot /usr/share/nginx/html
COPY nginx.conf /etc/nginx/nginx.conf