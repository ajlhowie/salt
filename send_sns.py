import boto3

client = boto3.client('sns')    

def send_sns(sns_topic_arn="arn:aws:sns:ap-southeast-2:096841396245:ITOPSOnCall",sns_message="SaltStack"):

    print(client.publish(TopicArn="arn:aws:sns:ap-southeast-2:096841396245:ITOPSOnCall",Message="SaltStack"))