import getClient from './getClient'

const response = (uniqueIps: string[]) => new Response(JSON.stringify({ uniqueIps }), {
    headers: { 'content-type': 'application/json' },
})
export async function POST(request: Request) {
    const { ip }: {ip: string} = await request.json()

    const client = await getClient()

    const uniqueIpsString = await client.get('ips')

    if (!uniqueIpsString) {
        const uniqueIps = [ip]
        await client.set('ips', JSON.stringify(uniqueIps))
        return response(uniqueIps)
    }

    const uniqueIps: string[] = JSON.parse(uniqueIpsString)
    
    if (!uniqueIps.find((uniqueIp) => uniqueIp === ip)) {
        uniqueIps.push(ip)
    }

    await client.set('ips', JSON.stringify(uniqueIps))

    return response(uniqueIps)
}
