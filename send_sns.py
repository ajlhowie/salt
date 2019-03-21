import boto3

client = boto3.client('sns')    

def send_sns(sns_topic_arn=None,sns_message=None):

    print(client.publish(TopicArn=sns_topic_arn,Message=sns_message))

send_sns(sns_topic_arn="arn:aws:sns:ap-southeast-2:096841396245:ITOPSOnCall",sns_message="new message")