/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   horses.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: ksonu <marvin@42.fr>                       +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2018/04/14 17:04:11 by ksonu             #+#    #+#             */
/*   Updated: 2018/04/14 18:26:08 by ksonu            ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <pthread.h>

void	*horses(void *ptr)
{
	while (!ptr)
	{
		printf("🐴");
		printf("🐎");
		printf("🦄");
	}
	return (NULL);
}

int		main(void)
{
	pthread_t	thread_s;

	pthread_create(&thread_s, NULL, horses, NULL);
	pthread_join(thread_s, NULL);
	return (0);
}
