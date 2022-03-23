# 1o passo - criar aquivo com políticas de segurança
# 2 passo - criar role de segurança na AWS

aws iam create-role \
    --role-name lambda-exemplo \
    --assume-role-policy-document file://politicas.json \
    | tee logs/role.log

# 3o passo - criar um arquivo com o conteúdo e zipá-lo

zip function.zip index.js

# 4o passo - criar a função lambda na AWS

aws lambda create-function \
    --function-name hello-cli \
    --zip-file fileb://function.zip \
    --handler index.handler \
    --runtime nodejs12.x \
    --role arn:aws:iam::748054292735:role/lambda-exemplo \
    | tee logs/lambda-create.log