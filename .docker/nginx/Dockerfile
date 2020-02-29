FROM nginx:1.15.0-alpine

# Remove o arquivo de configuração padrão do nginx
RUN rm /etc/nginx/conf.d/default.conf

# Cria o arquivo de configuração customizado
COPY ./nginx.conf /etc/nginx/conf.d

