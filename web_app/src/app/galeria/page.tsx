import fs from 'fs';
import path from 'path';
import Link from 'next/link';
import styles from './Galeria.module.css';

export default function GaleriaPage() {
  const imagesDir = path.join(process.cwd(), 'public', 'assets', 'images');
  let imageFiles: string[] = [];
  
  try {
    const files = fs.readdirSync(imagesDir);
    // Filtra apenas arquivos de imagem comuns
    imageFiles = files.filter(file => /\.(jpg|jpeg|png|webp|jfif)$/i.test(file));
  } catch (error) {
    console.error("Erro ao ler diretório de imagens", error);
  }

  return (
    <main className={styles.main}>
      <div className={`container ${styles.header}`}>
        <Link href="/#sobre" className="btn-primary" style={{ display: 'inline-block', textDecoration: 'none' }}>
          &larr; Voltar para o Site
        </Link>
        <h1 className={styles.title}>Galeria de Obras e Projetos</h1>
        <p className={styles.subtitle}>Conheça a qualidade e a excelência que a ES Construtora emprega em cada projeto realizado.</p>
      </div>
      
      <div className={`container ${styles.grid}`}>
        {imageFiles.map((img, idx) => (
          <div key={idx} className={styles.imgCard}>
            <img src={`/assets/images/${img}`} alt={`Obra ${idx}`} loading="lazy" />
          </div>
        ))}
      </div>
    </main>
  );
}
