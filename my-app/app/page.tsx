'use client'

import Image from 'next/image'
import { useEffect, useState } from 'react'
import styles from './page.module.css'

export default function Home() {
    const [totalVisitors, setTotalVisitors] = useState(0)


    const getCurrentIp = async () => {
        const res = await fetch('https://api.ipify.org?format=json')
        const data = await res.json()
        return data.ip
    }

    const getUniqueIps = async () => {
        const response = await fetch('/api', {
            method: 'POST',
            body: JSON.stringify({ ip: await getCurrentIp() }),
        })
        const { uniqueIps } = await response.json()
        return uniqueIps
    }

    const init = async () => {
        const uniqueIps = await getUniqueIps()
        const totalVisitors = uniqueIps.length
        setTotalVisitors(totalVisitors)
    }

    useEffect(() => {
        init()
    }, [])



    return (
        <main className={styles.main}>
            <div className={styles.description}>
                <div>
                    <a
                        href="https://vercel.com?utm_source=create-next-app&utm_medium=appdir-template&utm_campaign=create-next-app"
                        target="_blank"
                        rel="noopener noreferrer"
                    >
                        By{' '}
                        <Image
                            src="/vercel.svg"
                            alt="Vercel Logo"
                            className={styles.vercelLogo}
                            width={100}
                            height={24}
                            priority
                        />
                    </a>
                </div>
            </div>

            <div className={styles.center}>
                <Image
                    className={styles.logo}
                    src="/next.svg"
                    alt="Next.js Logo"
                    width={180}
                    height={37}
                    priority
                />
            </div>

            <div className={styles.grid}>
                <p>
                    <code>
                        App version: <b>1.0.0</b>
                    </code>
                </p>
                <p>
         
                    <code>
                    {' '}
                    {totalVisitors !== 0 ? (
                        `Total unique visitors: ${totalVisitors}`
                    ) : (
                        <>Loading...</>
                    )}
                    </code>
                </p>
            </div>
        </main>
    )
}
