"use client";

import React from 'react';
import { Swiper, SwiperSlide } from "swiper/react";
import { Autoplay } from "swiper/modules";
import "swiper/css";
import styles from './CarouselClientes.module.css';

const images = [
  "/assets/logos/logo0.png",
  "/assets/logos/logo1.png",
  "/assets/logos/logo2.png",
  "/assets/logos/logo3.jpg",
  "/assets/logos/logo5.png",
  "/assets/logos/logo4.png",
  "/assets/logos/logo6.jpg",
  "/assets/logos/logo7.png",
  "/assets/logos/logo8.png",
  "/assets/logos/logo9.png",
  "/assets/logos/logo10.png",
  "/assets/logos/logo11.png",
];

export default function CarouselClientes() {
  return (
    <div className={styles.carouselWrapper}>
      <Swiper
        modules={[Autoplay]}
        spaceBetween={10}
        loop={true}
        autoplay={{
          delay: 2000,
          disableOnInteraction: false,
        }}
        breakpoints={{
          0: {
            slidesPerView: 3, // mobile
          },
          580: {
            slidesPerView: 4, // tablet
          },
          800: {
            slidesPerView: 6, // desktop
          },
        }}
      >
        {images.map((img, index) => (
          <SwiperSlide key={index}>
            <div className={styles.slideContainer}>
              <img
                src={img}
                alt={`Logo cliente ${index}`}
                className={styles.logoImage}
              />
            </div>
          </SwiperSlide>
        ))}
      </Swiper>
    </div>
  );
}
