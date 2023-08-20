import uniqueIps from './uniqueIps'

export async function POST(request: Request) {
    const { ip } = await request.json()
    
    if (!uniqueIps.find((uniqueIp) => uniqueIp === ip)) {
        uniqueIps.push(ip)
    }

    return new Response(JSON.stringify({ uniqueIps }), {
        headers: { 'content-type': 'application/json' },
    })
}
