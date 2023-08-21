import { createClient } from 'redis'
var redisClient: any = undefined

const getClient = async () => {
    if (redisClient)
        return redisClient

    const redisHostname = process.env.REDIS_HOSTNAME
    const redisPort = process.env.REDIS_PORT
    const redisPassword = process.env.REDIS_ACCESS_KEY
    const redisUrl = `rediss://${redisHostname}:${redisPort}`

    redisClient = createClient({
        url: redisUrl,
        password: redisPassword,
    })
    redisClient.on("error", (error: string) => console.error(`Error : ${error}`));
  
    await redisClient.connect();
    console.log("Redis client connected");

    return redisClient
}
export default getClient