import type { Metadata } from 'next';
import { Inter, Quicksand } from 'next/font/google';
import './globals.css';

const inter = Inter({ subsets: ['latin'], variable: '--font-inter' });
const quicksand = Quicksand({ subsets: ['latin'], variable: '--font-quicksand' });

export const metadata: Metadata = {
  title: 'Everton Silva Construtora | Alagoinhas',
  description: 'ES Construtora. Especialistas em manutenção e ampliações da indústria civil e alimentícia.',
};

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <html lang="pt-BR" className={`${inter.variable} ${quicksand.variable}`}>
      <body>{children}</body>
    </html>
  );
}
