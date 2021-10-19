//package com.mycompany.webapp.config;
//
//import org.springframework.context.annotation.Bean;
//import org.springframework.context.annotation.Configuration;
//import org.springframework.data.redis.connection.RedisConnectionFactory;
////import org.springframework.data.redis.connection.RedisStandaloneConfiguration;
//import org.springframework.data.redis.connection.jedis.JedisConnectionFactory;
//import org.springframework.data.redis.connection.lettuce.LettuceConnectionFactory;
//import org.springframework.data.redis.core.RedisTemplate;
//import org.springframework.data.redis.repository.configuration.EnableRedisRepositories;
//import org.springframework.data.redis.serializer.StringRedisSerializer;
//
//import redis.clients.jedis.JedisPoolConfig;
//
//@Configuration
//@EnableRedisRepositories
//public class RedisConfig {
//
//   private String redisHost = "127.0.0.1";
//   
//   private int redisPort = 6379;
//   
////   private String redisPassword = "12345";
//   
//   
//   @Bean
//   public JedisPoolConfig jedisPoolConfig() {
//       JedisPoolConfig jedisPoolConfig = new JedisPoolConfig();
//       jedisPoolConfig.setMaxIdle(30);
//       jedisPoolConfig.setMinIdle(10);
//       jedisPoolConfig.setTestOnBorrow(true);
//       jedisPoolConfig.setTestOnReturn(true);
//       return jedisPoolConfig;
//   }
//
//   @Bean
//   public JedisConnectionFactory redisConnectionFactory() {
//       JedisConnectionFactory jedisConnectionFactory = new JedisConnectionFactory(jedisPoolConfig());
//       jedisConnectionFactory.setHostName(redisHost);
//       jedisConnectionFactory.setPort(redisPort);
////       jedisConnectionFactory.setPassword(redisPassword);
//       jedisConnectionFactory.setUsePool(true);
//       return jedisConnectionFactory;
//   }
//
//    @Bean
//    public RedisTemplate<String,String> redisTemplate() {
//        RedisTemplate<String,String> redisTemplate = new RedisTemplate<>();
//        redisTemplate.setKeySerializer(new StringRedisSerializer());
//        redisTemplate.setValueSerializer(new StringRedisSerializer());
//        // 지금 밑에 부분 설정은 필요 없는 상태임
//        redisTemplate.setConnectionFactory(redisConnectionFactory());
//        redisTemplate.setHashKeySerializer(new StringRedisSerializer());
//        redisTemplate.setHashValueSerializer(new StringRedisSerializer());
//        return redisTemplate;
//    }
//
//
//}